import * as express from 'express';
import { suggestRecipes } from './controller/suggestRecipe';

const suggestionService = express();
const PORT = 6000;

suggestionService.use(express.json());

suggestionService.get('/', (req, res) => {
    res.status(200).send('Suggestion service endpoint');
});

suggestionService.get('/withIngredients', (req, res) => {
    // res.status(200).send('Test API endpoint');

    const httpBody = req.body;
    const numIngredients = httpBody.queryIngredients.length;

    const testThreshold = 5;
    console.log('Using test threshold: ' + testThreshold);

    const IDs = [];

    for (let i = 0; i < numIngredients; i++) {
        IDs.push(httpBody.queryIngredients[i].databaseID);
    }

    const recipeHashes = suggestRecipes(IDs, testThreshold);
    console.log('returned from suggestRecipes');

    res.status(200).send('Result: ' + recipeHashes);
});

suggestionService.post('/', (req, res) => {
    res.status(200).send('Received HTPP POST at URL: ' + req.url);
});

suggestionService.post('/withIngredients', (req, res) => {
    const httpBody = req.body;
    const numIngredients = httpBody.queryIngredients.length;
    console.log('DEBUG: numIngredients = ' + numIngredients);

    let responseText = 'Got ingredients: ';
    for (let i = 0; i < numIngredients; i++) {
        responseText = responseText.concat(httpBody.queryIngredients[i].commonName);
        if (i < numIngredients - 1) {
            responseText = responseText.concat(', ');
        }
    }

    res.status(200).send(responseText);
});

suggestionService.put('/', (req, res) => {
    res.status(200).send('Received HTTP PUT at URL: ' + req.url);
});

suggestionService.delete('/', (req, res) => {
    res.status(200).send('Received HTTP DELETE at URL: ' + req.url);
});

suggestionService.listen(PORT, () => {
    console.log(`[Suggestion] running on port ${PORT}`);
});




/*
============ Sample POST request ============= 

curl --header "Content-Type: application/json" \
  --request GET \
  --data '{
    "userID": "123456789",
    "queryIngredients": [
        {
            "commonName": "broccoli",
            "databaseID": 1
        },
        {
            "commonName": "beef",
            "databaseID": 5
        },
        {
            "commonName": "garlic",
            "databaseID": 13
        },
        {
            "commonName": "brown rice",
            "databaseID": 7
        }
    ]
}' \http://localhost:6000/withIngredients
  
*/
