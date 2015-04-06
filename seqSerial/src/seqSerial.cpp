//seqSerial.cpp
#include <iostream>
#include <vector>

using namespace std;

int main()
{
    const int N=100000000;
    vector<int> a(N);
    for(int i=0; i<N; i++) a[i]=i;

    long sumA=0;
    for (int i=0; i<N; i++) sumA += a[i];

    long sumCheck=0;
    for (int i=0; i<N; i++) sumCheck += i;

    cout << "Host: " << sumCheck << endl;
    cout << "GPU:  " << sumA << endl;

    if (sumA == sumCheck) cout << "Test Succeeded!" << endl;
    else {
        cerr << "Test FAILED!";
        return(1);
    }
    return(0);
}