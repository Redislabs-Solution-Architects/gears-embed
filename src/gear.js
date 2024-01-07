#!js api_version=1.0 name=lib

import '@tensorflow/tfjs';
import  * as use from '@tensorflow-models/universal-sentence-encoder'; 

redis.registerAsyncFunction('test', async (asyncClient) => {
    return 'hello world';
});