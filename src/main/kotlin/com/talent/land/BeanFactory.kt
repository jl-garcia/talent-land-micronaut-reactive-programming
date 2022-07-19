package com.talent.land

import io.micronaut.context.annotation.Factory
import io.micronaut.context.annotation.Value
import jakarta.inject.Singleton
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedAsyncClient
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient
import software.amazon.awssdk.services.dynamodb.DynamoDbAsyncClient
import software.amazon.awssdk.services.dynamodb.DynamoDbClient
import java.net.URI

@Factory
class BeanFactory(
        @Value("\${dynamodb.endpoint:}") val dynamoDBEndpoint: String
) {
    @Singleton
    fun dynamoDbEnhancedAsyncClient(): DynamoDbEnhancedAsyncClient {
        return DynamoDbEnhancedAsyncClient.builder()
                .dynamoDbClient(
                        DynamoDbAsyncClient.builder()
                                .endpointOverride(URI.create(dynamoDBEndpoint))
                                .build()
                ).build()
    }

    @Singleton
    fun dynamoDbClient(): DynamoDbEnhancedClient? {
        return DynamoDbEnhancedClient.builder()
                .dynamoDbClient(
                        DynamoDbClient.builder()
                                .endpointOverride(URI.create(dynamoDBEndpoint))
                                .build()
                ).build()

    }
}