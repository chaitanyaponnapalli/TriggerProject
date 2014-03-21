trigger BikesOrderMgmtQuote on Quote (after update) {

BikesOrderMgmtQuoteHandler bikesOrderMgmtHandler = new BikesOrderMgmtQuoteHandler();

bikesOrderMgmtHandler.createHandler(Quote.sObjectType);
}