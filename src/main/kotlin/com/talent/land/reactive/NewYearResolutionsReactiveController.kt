package com.talent.land.reactive

import com.talent.land.NewYearResolutions
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.PathVariable
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@Controller("/reactive/resolutions")
class NewYearResolutionsReactiveController(private val newYearResolutionsReactiveService: NewYearResolutionsReactiveService) {

    private val log: Logger = LoggerFactory.getLogger(NewYearResolutionsReactiveController::class.java)

    @Get("/{tweetId}")
    fun getResolutionsByTweetId(@PathVariable tweetId: String): Mono<NewYearResolutions> {
        return newYearResolutionsReactiveService.findByTweetId(tweetId)
    }

    @Get("/gender/{gender}")
    fun getResolutionsByGender(@PathVariable gender: String): Flux<NewYearResolutions> {
        return newYearResolutionsReactiveService.findByGender(gender)
    }

    @Get("/gender/{gender}/contains/{text}")
    fun getResolutionsByGenderAndText(@PathVariable gender: String, @PathVariable text: String): Flux<NewYearResolutions> {
        //log.info("In controller: ${Thread.currentThread()}")
        return newYearResolutionsReactiveService.findByGenderAndText(gender, text)
    }

    @Get("/gender/{gender}/contains/{text}/extra-column")
    fun getWithExtraColumn(@PathVariable gender: String, @PathVariable text: String): Flux<NewYearResolutions> {
        return newYearResolutionsReactiveService.addNewColumn(gender, text)
    }

}