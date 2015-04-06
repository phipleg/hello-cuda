//seqCuda.cu
#include<iostream>
using namespace std;

#include <thrust/reduce.h>
#include <thrust/sequence.h>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

int main()
{
    const int N=10000;

    thrust::device_vector<int> a(N);
    thrust::sequence(a.begin(), a.end(), 0);
    long sumA= thrust::reduce(a.begin(), a.end(),0);
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