package other;
import static java.lang.System.out;
public class Trim {

	public static void main(String[] args) {
		String temp = "    I want  to     learn   java hahh   .    ";
		out.println(temp.replaceAll("^ *", "").replaceAll(" +", " ").replaceAll(" $",""));
		
	}

}
