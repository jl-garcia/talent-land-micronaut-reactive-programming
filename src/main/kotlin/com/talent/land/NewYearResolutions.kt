package com.talent.land

import io.micronaut.core.annotation.Introspected
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbAttribute
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbSecondaryPartitionKey
import javax.validation.constraints.NotBlank

@Introspected
@DynamoDbBean
data class NewYearResolutions(
        @get:DynamoDbPartitionKey
        @get:DynamoDbAttribute(value = "tweet_id")
        var tweetId: String? = null,

        @get:DynamoDbAttribute(value = "tweet_text")
        var tweetText: String = "",

        @field:NotBlank
        @get:DynamoDbAttribute(value = "name")
        var name: String? = null,

        @field:NotBlank
        @get:DynamoDbAttribute(value = "gender")
        @get: DynamoDbSecondaryPartitionKey(indexNames = ["gsi_gender"])
        var gender: String? = null,

        @field:NotBlank
        @get:DynamoDbAttribute(value = "resolution_category")
        var resolutionCategory: String? = null,

        @field:NotBlank
        @get:DynamoDbAttribute(value = "retweet_count")
        var retweetCount: String? = null,

        @field:NotBlank
        @get:DynamoDbAttribute(value = "location")
        var localtion: String? = null,

        var duration: Long? = null,
) {}