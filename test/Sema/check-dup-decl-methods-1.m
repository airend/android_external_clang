// RUN: clang -fsyntax-only -verify %s

@interface SUPER
- (int) meth;
+ (int) foobar;
@end

@interface T @end

@interface class1 : SUPER
- (int) meth;	// expected-error {{previous declaration is here}}
- (int*) meth;	// expected-error {{duplicate declaration of method 'meth'}}
- (T*) meth1;  
- (T*) meth1;
+ (T*) meth1;
@end

@interface class1(cat)
- (int) catm : (char)ch1; // expected-error {{previous declaration is here}}
- (int) catm1 : (char)ch : (int)i;
- (int) catm : (char*)ch1; // expected-error {{duplicate declaration of method 'catm:'}}
+ (int) catm1 : (char)ch : (int)i;
+ (T*) meth1;
@end

@interface class1(cat1)
+ (int) catm1 : (char)ch : (int)i; // expected-error {{previous declaration is here}}
+ (T*) meth1; // expected-error {{previous declaration is here}}
+ (int) catm1 : (char)ch : (int*)i; // expected-error {{duplicate declaration of method 'catm1::'}}
+ (T**) meth1; // expected-error {{duplicate declaration of method 'meth1'}}
+ (int) foobar;
@end

@protocol P
- (int) meth; // expected-error {{previous declaration is here}}
- (int*) meth; // expected-error {{duplicate declaration of method 'meth'}}
@end

