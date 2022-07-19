package com.talent.land.non.reactive

import io.micronaut.context.annotation.Value
import jakarta.inject.Singleton
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient
import software.amazon.awssdk.enhanced.dynamodb.Key
import software.amazon.awssdk.enhanced.dynamodb.TableSchema
import software.amazon.awssdk.enhanced.dynamodb.model.QueryConditional
import org.slf4j.Logger
import org.slf4j.LoggerFactory


@Singleton
class NewYearResolutionRepository(
        dynamoDbClient: DynamoDbEnhancedClient,
        @Value("\${dynamodb.new-year-resolutions-table-name}") val newYearResolutionsTable: String
) {
    private val log: Logger = LoggerFactory.getLogger(NewYearResolutionRepository::class.java)
    private val tableSchema = TableSchema.fromBean(NewYearResolutions::class.java)
    private val table = dynamoDbClient.table(newYearResolutionsTable, tableSchema)
    private val genderIndex = table.index("gsi_gender")

    fun findById(tweetId: String): NewYearResolutions {
        val key: Key = Key.builder().partitionValue(tweetId).build()
        return table.getItem(key)
    }

    fun findByGender(gender: String): List<NewYearResolutions> {
        log.info("En el repository no reactivo")
        val key: Key = Key.builder()
                .partitionValue(gender).build()

        return genderIndex.query(QueryConditional.keyEqualTo(key))
                .flatMap { pages -> pages.items() }
    }

}