package other;

public class GreatestCommonDivisor {

	public static void main(String[] args) {
		System.out.println(gcd(500,50));
	}
	public static long gcd(long m, long n) {
		while(n != 0) {
			long rem = m % n;
			m = n;
			n = rem;
		}
		return m;
	}
}
