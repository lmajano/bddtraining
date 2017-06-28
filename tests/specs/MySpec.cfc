/**
* My BDD Test
*/
component extends="testbox.system.BaseSpec"{

/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		addMatchers( {
			toBeARanger : function( expectation, args ){

				var rangers = [ "Carlos", "Henrik", "Chuck Norris" ];
				expectation.message = "#expectation.actual# is not a ranger, booooooo!";
				return ( expectation.isNot ? !arrayContainsNoCase( rangers, expectation.actual ) : arrayContainsNoCase( rangers, expectation.actual ) );

			}
		} );
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
	}

	function isLucee(){
		return structKeyExists( server, "lucee" );
	}

	function divide( a, b ){
		return a / b;
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){

		describe( "Custom Matchers", function(){

				it( "can be a ranger", function(){
					expect( "Carlos" ).toBeARanger();
				});

				it( "cannot be a ranger", function(){
					expect( "Nicholas" ).notToBeARanger();
				});

				it( "cannot be a ranger", function(){
					expect( "Luis" ).notToBeARanger();
				});
		});

		describe( "Division", function(){
			it( "works for non-zero numbers", function(){
				expect( divide( 5, 1 ) ).toBe( 5 );
			});
			it( "should throw an exception for divide by zero", function(){
				expect( function(){
					divide( 5, 0 );
				} ).toThrow();
			});
		} );

		describe( title="Mini Load Tester", asyncAll=true, body=function(){

			for( var x = 1; x lte 100; x++ ){
				it( "can execute thread #x#", function(){
					sleep( randRange( 1, 500 ) );
					expect( 0 ).toBe( 0 );
				});
			}

		} );

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
					expect( x ).toBe( 2 );
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
			title   : "My Second Suite",
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
