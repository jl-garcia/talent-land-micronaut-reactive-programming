package com.talent.land.non.reactive

import jakarta.inject.Singleton
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Singleton
class NewYearResolutionService(private val newYearResolutionRepository: NewYearResolutionRepository) {
    private val log: Logger = LoggerFactory.getLogger(NewYearResolutionService::class.java)

    fun findByTweetId(tweetId: String): NewYearResolutions {
        return newYearResolutionRepository.findById(tweetId)
    }

    fun findByGender(gender: String): List<NewYearResolutions> {
        return newYearResolutionRepository.findByGender(gender)
    }

     fun findByGenderAndText(gender: String, text: String): List<NewYearResolutions> {
         log.info("En el service no reactive")
        return newYearResolutionRepository.findByGender(gender)
                .filter { it.tweetText.contains(text, true) }
                .ifEmpty {
                    listOf(NewYearResolutions(
                            tweetText = "This is a default tweet"
                    ))
                }
    }
}