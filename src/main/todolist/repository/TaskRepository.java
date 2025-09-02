package todolist.repository;


public class TaskRepository {

    private List<Task> tasks;

    public TaskRepository() {
        tasks = new ArrayList<>();
    }

    // Create
    public void addTask(Task task) {
        tasks.add(task);
    }

    // Read
    public List<Task> getAllTasks() {
        return tasks;
    }

    // Delete
    public void deleteTask(int index) {
        if (index >= 0 && index < tasks.size()) {
            tasks.remove(index);
        } else {
            System.out.println("Invalid index.");
        }
    }
}