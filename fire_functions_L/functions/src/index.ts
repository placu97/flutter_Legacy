import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();// initializes admin sdk

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const getOneFirestoreDoc =
    functions.region("europe-west6").https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Zuurich!");
	const promise = admin.firestore().doc("/products/4tL7kLtzR2WR1NALwKmT").get();
    promise.then( (snapshot) => {
        const data = snapshot.data();
        response.send(data);
    }).catch( (error) => {
        // Error Handling
        console.log("Error: \n"+error);
        response.status(500).send(error);
    });
});
