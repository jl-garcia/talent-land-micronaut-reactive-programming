package com.talent.land.reactive

import com.talent.land.NewYearResolutions
import jakarta.inject.Singleton
import org.reactivestreams.Publisher
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import java.time.Duration

@Singleton
class NewYearResolutionsReactiveService(private val newYearResolutionReactiveRepository: NewYearResolutionReactiveRepository) {

    private val log: Logger = LoggerFactory.getLogger(NewYearResolutionsReactiveService::class.java)

    fun findByTweetId(resolutionId: String): Mono<NewYearResolutions> {
        return newYearResolutionReactiveRepository.findById(resolutionId)
    }

    fun findByGender(gender: String): Flux<NewYearResolutions> {
        return newYearResolutionReactiveRepository.findByGender(gender)
    }

    fun findByGenderAndText(gender: String, text: String): Flux<NewYearResolutions> {
        //Misma logica que el NewYearResolutionService - diferentes APIs - Sin bloquear el flujo - ✔
        return newYearResolutionReactiveRepository.findByGender(gender)
                .filter { it.tweetText.contains(text, true) }
                .switchIfEmpty(Flux.just(NewYearResolutions(tweetText = "This is a default tweet")))

        // Contiene una operacion que bloquea el flujo - X
       /* return Flux.fromIterable(
                listOf(
                        newYearResolutionReactiveRepository.findByGender(gender)
                                .filter { it.tweetText.contains(text, true) }
                                .blockFirst()
                )
        )*/
    }

    fun addNewColumn(gender: String, text: String): Flux<NewYearResolutions> {
        return newYearResolutionReactiveRepository.findByGender(gender)
                .filter { it.tweetText.contains(text, true) }
                .zipWith(newColumn())
                .map { it.t1.copy(
                        duration = it.t2
                ) }
    }

    private fun newColumn(): Publisher<Long> {
        val milis: Long = 1000
        return Flux
                .interval(Duration.ofMillis(milis))
                .map { it * milis/1000 }
    }
}
