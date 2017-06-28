/**
* My BDD Test
*/
component extends="testbox.system.BaseSpec"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
	}

	function isLucee(){
		return structKeyExists( server, "lucee" );
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){

		describe( "Outter Describe", function(){
			beforeEach(function( currentSpec ){
				x = 1;
			});
			
			afterEach( function() {
				debug( x );
			} );

			describe( "Inner Describe", function(){
				beforeEach(function( currentSpec ){
					x++;
				});

				afterEach( function() {
					x--;
				} );
				
				it( "can validate a spec", function(){
					debug( x );	
				});
			});

			it( "can validate a spec", function(){
				expect(	0 ).toBe( 0 );
			});
		
		});

		// all your suites go here.
		describe( "My First Suite", function(){

			it( "A Spec", function(){
				expect(	false ).toBeFalse();
			});

		});

		describe( "Testing around", function(){

			aroundEach( function( spec, suite ) {
				myName = "Luis";
				arguments.spec.body();
			} );

			it( "can validate around variables", function(){
				expect(	myName ).toBe( "Luis" );
			});
		
		});

		describe( 
			title 	: "My Second Suite", 
			labels	: "cli", 
			skip  	: function(){
				return false;
			}, 
			body  	: function(){

				beforeEach(function( currentSpec ){
					coldbox = 22;
				});

				afterEach( function() {
					coldbox = 0;
				} );

				it( "can validate coldbox", function(){
					expect(	coldbox ).toBe( 22 );
				});
				it( "can validate coldbox 2", function(){
					expect(	coldbox ).toBe( 22 );
				});
		
				it( "can validate an email", function(){
					expect(	"lmajano@gmail.com" ).toBeEmail();
				});

				it( "can validate integers", function(){
					expect(	1.45 ).notToBeInteger();
				});
		
			}
		);
	}
	
}