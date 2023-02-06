import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import Stripe from "stripe";
admin.initializeApp();// initializes admin sdk

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const sayWhatever = functions.https.onRequest( (equest, response) => {
    response.send("Ciaoooo");
});

export const getOneFirestoreDoc =
    functions.region("europe-west6").https.onRequest((request, response) => {
    //   functions.logger.info("Hello logs!", {structuredData: true});
    //   response.send("Hello from Zuurich!");
    
    // PRACTICAL RESOLUTION :
    // i get the Promise* with Get*
    // admin.firestore().doc("").get()
    // // Once i get It* i pass to an another anonymous func
    // .then((snapshot) => {

    // // ABC-Always_Be_Catching
    // }).catch( (error) => {

    // });
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

// ************ PAYMENT **************
const stripe = new Stripe("sk_test_51KE9JHAwt1N80TMUeN8PzYRsIP7FzG7QsULVPvkZMKG6fMYxGndMSbob7lk7FA7jgKV8d937bb4F4NLJi5RDJlbg00V2mqcngy",
    { apiVersion: "2020-08-27" }
);
//const stripe = require('stripe')(functions.config().stripe.testkey);
export const createPaymentIntent = functions.https.onRequest(async (req, res) => {
    stripe.paymentIntents.create({// eleimina e rifai tutto
        currency: req.query.amount,
        amount: 11,
    },
    function(err, paymentIntent) {
        if (err !== null) {
            console.log("Error! ",err);
            res.send(err);
        } else {
            console.log("Created PaymentIntent: ", paymentIntent);
            res.json({
                paymentIntent: paymentIntent
            })
        }
    })
})

// ****** STRIPE 2FA KEY 
//htib-dusa-iair-tsdw-ptnn
//                        ******


