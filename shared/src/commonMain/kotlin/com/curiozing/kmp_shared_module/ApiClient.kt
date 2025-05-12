package com.curiozing.kmp_shared_module

import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.request.get
import io.ktor.client.statement.HttpResponse
import io.ktor.client.statement.bodyAsText
import io.ktor.serialization.kotlinx.json.json

class ApiClient {

    private val client = HttpClient{
        install(ContentNegotiation){
            json()
        }
    }

    suspend fun getMessage():String{
        val response:HttpResponse = client.get("https://api.sampleapis.com/coffee/hot")
        return response.bodyAsText()
    }
}

class ApiUseCase(private val client: ApiClient = ApiClient()) {
    suspend fun fetchMessage(): String = client.getMessage()
}