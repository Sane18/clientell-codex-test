/**
 * @description Tests the CFHello greeting service.
 */
@IsTest
private with sharing class CFHelloTest {

    /**
     * @description Verifies that the greeting matches the expected value.
     */
    @IsTest
    static void sayHi_returnsHi() {
        User currentUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];

        System.runAs(currentUser) {
            Test.startTest();
            String greeting = CFHello.sayHi();
            Test.stopTest();

            System.assertEquals('hi', greeting, 'The greeting should be hi.');
        }
    }
}