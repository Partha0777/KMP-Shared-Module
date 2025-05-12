package com.curiozing.kmp_shared_module

import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch

class ApiBridge {
    private val scope = MainScope()
    private val useCase = ApiUseCase()

    fun getMessage(callback: (String) -> Unit){
        scope.launch {
            try {
                val result = useCase.fetchMessage()
                callback(result)
            }catch (e:Exception){
                e.printStackTrace()
            }
        }
    }
}