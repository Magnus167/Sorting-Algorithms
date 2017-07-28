void selectionSort(int arr[], int n)
{
    int i, j, minLocation;
 
    // One by one move boundary of unsorted subarray
    for (i = 0; i < n-1; i++)
    {
        // Find the smallest element in unsorted array
        minLocation= i;
        for (j = i+1; j < n; j++)
          if (arr[j] < arr[minLocation])
            min_idx = j;
 
        // Swap the found smallest value with the first item
        
    }
}
