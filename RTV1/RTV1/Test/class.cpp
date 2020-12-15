//
//  class.cpp
//  Test
//
//  Created by Wei Li on 2020-12-14.
//

#include <iostream>
using namespace std;

class Sales_data {
public:
    Sales_data(){
        cout << "this-> of this instance is " << this << endl;
//        int a = 1;
//        this = &a; // error, "this" is a const pointer
    }
public:
    /* CONST MEMBER FUNCTION */
    string isbn() const { // <=> string Sales_data::isbn(const Sales_data * const this)
//      bookNo = "shall we change the member variable here?"; // error because of "const" after isbn()
        // "const" makes implicit "this" pointer constant
        // (by default "this" is a const pointer to non-const class type)
        // isbn() may READ but not WRITE to the data of the objects on which it is called
        return bookNo;
    }
    Sales_data& combine(const Sales_data&);
    double avg_price() const;
    
    unsigned getUnitSold() {return units_sold;}
    double getRevenue() {return revenue;}
private:
    string bookNo;
    unsigned units_sold = 42;
    double revenue = 21.0;
};

Sales_data& Sales_data::combine(const Sales_data &rhs){
    units_sold += rhs.units_sold; // add the members of rhs into the members of "this" object
    // this->unit_sold  = this->unit_sold + rhs.units_sold
    revenue += rhs.revenue;
    return *this; // return the object on which the function was called
}

double Sales_data::avg_price() const { // :: scope operator
    if (units_sold)
        return revenue/units_sold;
    else
        return 0;
}

// nonmember Sales_data interface functions
Sales_data add(const Sales_data&, const Sales_data&);
ostream &print(ostream&, const Sales_data&);
istream &read(istream&, Sales_data&);


class BaseClass {
public:
    virtual bool scatter() const = 0;
};

class Class1 : BaseClass{
    bool scatter() const;
};

int main(){
    Sales_data total1;
    Sales_data total2;
    cout << &total1 << endl; // <=> "this"
    cout << &total2 << endl;
    
    string s = total1.isbn(); // <=> Sales_data::isbn(&total)
    
    const Sales_data total_const;
    //cout << total_const.getRevenue() << endl; // fail
    cout << total_const.isbn(); // ok, because isbn() is const
    
    return 0;
}
