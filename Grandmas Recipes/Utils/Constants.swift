//
//  Constants.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//


import SwiftUI
import Foundation
import Firebase


//var CurrentUserId = CURRENT_USER_ID

//DEFAULT FONT
var largeFont = 32
var medFont = 28




struct Messages {
    
    static let storeSavedFailure = "Unable to save the store!"
}

var NOSTYLE =  true
let DEMO_ID = "mxu44uWUqANZD2Jfv63JgGAFVTK2"

var CURRENT_STORE_ID = ""

// Brand Name
let BRAND_NAME = "YAW DENIM"







// PRODUCT
let DEFAULT_PRODUCT = "defaultProduct"
let DEFAULT_SHIRT =  "defaultShirt"

// PRODUCT COLLECTION
let DEFAULT_COLLECTION = "defaultCollection"




let COLLECTION_BASKETS = Firestore.firestore().collection("baskets")

//let COLLECTION_BASKETS = Firestore.firestore().collection("baskets")

let COLLECTION_SUBSCRIPTIONS = Firestore.firestore().collection("subscriptions")
let COLLECTION_SUBSCRIPTION_TYPES = Firestore.firestore().collection("subscriptionTypes")


let COLLECTION_STORES = Firestore.firestore().collection("stores")


// PRODUCTS
let COLLECTION_PRODUCTS = Firestore.firestore().collection("products")
let COLLECTION_ALL_PRODUCTS = Firestore.firestore().collection("allProducts")

// PRODUCT VARIANTS
let COLLECTION_PRODUCT_VARIANTS = Firestore.firestore().collection("productVariants")


// PRODUCT COLLECTIONS
let COLLECTION_PRODUCTS_COLLECTIONS = Firestore.firestore().collection("productCollections")
let COLLECTION_ALL_PRODUCTS_COLLECTIONS = Firestore.firestore().collection("allPCollections")


// CART
let COLLECTION_CARTS = Firestore.firestore().collection("carts")
//let COLLECTION_CARTS = Firestore.firestore().collection("carts")


let COLLECTION_STYLES = Firestore.firestore().collection("styles")
let COLLECTION_STYLE_COLLECTIONS = Firestore.firestore().collection("styleCollections")


let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_ORDERS = Firestore.firestore().collection("orders")




//let COLLECTION_USER_STORES = Firestore.firestore().collection("users").document().collection("stores").document()






// Lazy Grid
let columns = [
    
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0)
    
]
