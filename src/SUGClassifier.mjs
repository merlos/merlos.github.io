import neuralNetwork from '../lib/ml5/NeuralNetwork/index.mjs';
import path from 'path';
import fs from 'fs';
import parse from 'csv-parse';

export class SUGClassifier {

    task = 'classification';

    constructor( dataFilePath, inputs, outputs, classifyFilePath ) {
        console.log('data file path: ', `file:///${path.join(process.cwd(), dataFilePath)}`);
        const options = {
            dataUrl: `file:///${path.join(process.cwd(), dataFilePath)}`,
            task: this.task,
            inputs: inputs,
            outputs: outputs
        };
        this.nn = neuralNetwork(options); 
        this.classifyFilePath = path.join(process.cwd(), classifyFilePath);   
        this.inputs = inputs;    
        return this;
    }

    async init(){
        await this.nn.init();
    }

    async train(){
        // continue on your neural network journey
        this.nn.normalizeData();
        const trainingOptions = {
            epochs: 32,
            batchSize: 12
        }
        await this.nn.train(trainingOptions);
    }
    
    finishedTraining(){
        console.log('Training Complete.');
        classify();
    }
    
    // make a classification
    classify(){

        const nn = this.nn;
        const handleResults = this.handleResults;

        fs.readFile(this.classifyFilePath, function (err, fileData) {
            parse(fileData, {columns: false, trim: true}, function(err, rows) {
              // Your CSV data is in an array of arrys passed to this callback as rows.
              for( let i = 1; i < rows.length; i++ ){
                let row = rows[i];
                let input = {
                    groupCount: parseFloat(row[1]),
                    signupCount: parseFloat(row[2]),
                    percentCustomImages: parseFloat(row[3]),
                    percentPayments: parseFloat(row[4]),
                    percentCustomFields: parseFloat(row[5]),
                    avgSlotCount: parseFloat(row[6])
                }
                nn.classify(input, handleResults);
              }
            })
          })
        
          /*
          const input = {
            groupCount: 100,
            signupCount: 530,
            percentCustomImages: 0.10,
            percentPayments: 0.33,
            percentCustomFields: 0.89,
            avgSlotCount: 25
        }
        this.nn.classify(input, this.handleResults);
        */

    }
    
    // Step define a function to handle the results of your classification
    handleResults(error, result) {
        if(error){
            console.error(error);
            return;
        }
 
        console.info("Classification: ", result[0].label);
        console.info("Confidence: " + result[0].confidence.toFixed(2)*100 + "%");
        console.info("=====================================");
    }
}