#include <iostream>
#include "ran3.h"
using namespace std;

int main()
{
	double r;
	int seed=-942128472;

	for(int i=0;i<1000000;i++)
	{	
		r=10*(1-2*ran3(&seed));
		cout<<r<<endl;
	}

	return 0;
}
