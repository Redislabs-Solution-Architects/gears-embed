import '@tensorflow/tfjs';
import  * as use from '@tensorflow-models/universal-sentence-encoder'; 

(async () => {
    const model = await use.load();
    const out = await model.embed('hello world');
    console.log(out.arraySync()[0]);
})();