package search;

public class MaxSubsequence {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] a = {1, -2, 3, 10, -4, 7, 2, -5};
		System.out.println(maxSubSum(a));
	}
	/**
	 * Linear-time maximum contiguous subsequence sum algorithm
	 */
	public static int maxSubSum(int[] a) {
		int maxSum = 0, thisSum = 0;
		for( int j = 0; j < a.length; j++) {
			thisSum += a[j];
			if (thisSum > maxSum)
				maxSum = thisSum;
			else if(thisSum < 0)
				thisSum = 0;
		}
		return maxSum;
	}
}
