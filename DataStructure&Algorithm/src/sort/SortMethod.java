package sort;

import java.util.Arrays;

public class SortMethod {

	public static void main(String[] args) {
		Integer[]  array = {3,4,1,4,12,5,6,9,11,53,13,55,36,90,38,95,74};
		quick(array);
		System.out.println(Arrays.toString(array));
	}
	public static <T extends Comparable<? super T>> void quick(Integer[] array) {
		quick(array, 0, array.length);
	}
	/**
	 * bubble sort(stable): average O(n^2), worst O(n^2), best O(n)
	 */
	public static <T extends Comparable<? super T>> void bubble(T[] arr) {
		boolean flag = true;
		for (int i = 0, len = arr.length; i < len - 1 && flag; i++) {
			flag = false;
			for (int j = 0; j < len - 1 - i; j++)
				if (arr[j + 1].compareTo(arr[j]) < 0) {
					swap(arr, j, j + 1);
					flag = true;
				}
		}
	}
	/**
	 * select sort(stable): average O(n^2), worst O(n^2), best O(n^2) 
	 */
	public static <T extends Comparable<? super T>> void select(T[] arr) {
		int min;
		for (int i = 0, len = arr.length; i < len-1; i++) {
			min = i;
			for (int j = i+1; j < len; j++) {
				if (arr[min].compareTo(arr[j]) > 0)
					min = j;
			}
			if (min != i)
				swap(arr, i, min);
		}
	}

	/**
	 * shell sort(unstable): average O(nlogn), worst O(n^2), best(n^2)
	 */
	public static <T extends Comparable<? super T>> void shell(T[] array) {
		int len,gap;
		gap = len = array.length;
		do {
			gap = gap/3 +1;
			for (int i = gap; i < len; i++) {
				for (int j = i - gap; j >= 0 && array[j].compareTo(array[j+gap]) < 0; j-=gap) {
					swap(array,j+gap,j);
				}
			}
		}while(gap > 1);
	}
	/**
	 * insert sort(stable): average O(n^2), worst O(n^2), best O(n)
	 */
	public static <T extends Comparable<? super T>> void insert(T[] arr) {
		int j;
		for (int i = 1, len = arr.length; i < len; i++) {
			T temp = arr[i];
			for (j = i - 1; j >= 0 
				&& (arr[j].compareTo(temp) > 0); j--)
				arr[j+1] = arr[j];
			arr[j+1] = temp;
		}
	}
	/**
	 * quick sort(unstable): average O(nlogn), worst O(n^2), best(nlogn)
	 */
	public static <T extends Comparable<? super T>> void quick(T[] arr, int left, int right) {
		while(left < right) {
		
		int last = partition(arr, left, right-1);
		
		quick(arr, left, last-1);
		left = last+1;		// 尾递归
		}
	}
	private static <T extends Comparable<? super T>> int partition(T[] arr, int left, int right) {
		// 三数选中
		int mid = left + right >> 1;

		if (arr[mid].compareTo(arr[right]) > 0)
			swap(arr, mid, right);
		if (arr[left].compareTo(arr[mid]) > 0)
			swap(arr, mid, left);
		if (arr[mid].compareTo(arr[right]) > 0)
			swap(arr, mid, right);
		int last = left;
		swap(arr, left, mid);
		for (int i = left + 1; i <= right; i++)
			if (arr[left].compareTo(arr[i]) < 0)
				swap(arr, ++last, i);
		swap(arr, last, left);
		return last;
	}

	public static <T> void swap(T[] array, int i, int j) {
		T temp = array[i];
		array[i] = array[j];
		array[j] = temp;
	}
}
