package com.talent.land.non.reactive

import com.talent.land.NewYearResolutions
import io.micronaut.http.HttpResponse
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.PathVariable
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Controller("/resolutions")
class NewYearResolutionController(private val newYearResolutionService: NewYearResolutionService) {

    private val log: Logger = LoggerFactory.getLogger(NewYearResolutionController::class.java)

    @Get("/{tweetId}")
    fun getResolutions(@PathVariable tweetId: String): HttpResponse<NewYearResolutions> {
        return  HttpResponse.ok(newYearResolutionService.findByTweetId(tweetId))
    }

    @Get("/gender/{gender}")
    fun getResolutionsByGender(@PathVariable gender: String): List<NewYearResolutions> {
        return newYearResolutionService
                .findByGender(gender)
    }

    @Get("/gender/{gender}/contains/{text}")
    fun getResolutionsByGenderAndText(@PathVariable gender: String, @PathVariable text: String): List<NewYearResolutions> {
        log.info("En el controller no reactive")
        return newYearResolutionService.findByGenderAndText(gender, text)
    }

}