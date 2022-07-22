package com.talent.land.reactive

import com.talent.land.NewYearResolutions
import io.micronaut.context.annotation.Value
import jakarta.inject.Singleton
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedAsyncClient
import software.amazon.awssdk.enhanced.dynamodb.Key
import software.amazon.awssdk.enhanced.dynamodb.TableSchema
import software.amazon.awssdk.enhanced.dynamodb.model.QueryConditional

@Singleton
class NewYearResolutionReactiveRepository (
        dynamoDbEnhancedAsyncClient: DynamoDbEnhancedAsyncClient,
        @Value("\${dynamodb.new-year-resolutions-table-name}") val newYearResolutionsTable: String
        ) {

    private val log: Logger = LoggerFactory.getLogger(NewYearResolutionReactiveRepository::class.java)
    private val tableSchema = TableSchema.fromBean(NewYearResolutions::class.java)
    private val table = dynamoDbEnhancedAsyncClient.table(newYearResolutionsTable, tableSchema)
    private val genderIndex = table.index("gsi_gender")

    fun findById(resolutionId: String): Mono<NewYearResolutions> {
        val key: Key = Key.builder().partitionValue(resolutionId).build()
        return Mono.fromFuture(table.getItem(key))
    }

    fun findByGender(gender: String): Flux<NewYearResolutions> {
        val key: Key? = Key.builder()
                .partitionValue(gender).build()

        return Flux.from(genderIndex.query(QueryConditional.keyEqualTo(key))
                .flatMapIterable{ page -> page.items() })
    }
}