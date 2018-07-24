class person{
private:
	int age;
public:
	person(int a){
		this->age=a;		
	}
	inline bool operator == (const person &ps) const;
};

inline bool person::operator == (const person &ps) const{
	if(this->age==ps.age)
		return true;
	return false;
}
