import { SUGClassifier } from "./SUGClassifier.mjs";


 const sugc = new SUGClassifier(
        'data/test5.csv',
        ['groupCount','signupCount','percentCustomImages','percentPayments','percentCustomFields','avgSlotCount'],
        ['subscripitonLevel'],
        'data/results.csv'
    );
await sugc.init();
console.log('neural network initialized');
await sugc.train();
console.log('training complete');
sugc.classify();