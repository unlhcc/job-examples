import java.lang.Thread;
public class HelloWorld {
	public static void main(String [] args){
		for (int i=0; i<5; i++){
			System.out.println("Hello World! I am at step " + i + " of the loop in index #" + System.getenv("SLURM_ARRAY_TASK_ID") + "!");
		}
	}
}

