package todolist.ui;

import todolist.model.Task;
import todolist.repository.TaskRepository;
import java.util.List;
import java.util.Scanner;

public class Menu {

    private TaskRepository repo;
    private Scanner scanner;

    public Menu(TaskRepository repo) {
        this.repo = repo;
        scanner = new Scanner(System.in);
    }

    public void show() {
        int option = -1;
        while (option != 0) {
            System.out.println("\n===== TODO List Menu =====");
            System.out.println("1 - Add Task");
            System.out.println("2 - List All Tasks");
            System.out.println("3 - Delete Task");
            System.out.println("4 - List by Category");
            System.out.println("5 - List by Priority");
            System.out.println("6 - List by Status");
            System.out.println("0 - Exit");
            System.out.print("Choose an option: ");
            option = scanner.nextInt();
            scanner.nextLine(); // skip newline

            switch (option) {
                case 1:
                    addTask();
                    break;
                case 2:
                    listTasks();
                    break;
                case 3:
                    deleteTask();
                    break;
                case 4:
                    listByCategory();
                    break;
                case 5:
                    listByPriority();
                    break;
                case 6:
                    listByStatus();
                    break;
                case 0:
                    System.out.println("Exiting...");
                    break;
                default:
                    System.out.println("Invalid option.");
            }
        }
    }

    private void addTask() {
        System.out.print("Name: ");
        String name = scanner.nextLine();
        System.out.print("Description: ");
        String description = scanner.nextLine();
        System.out.print("Due Date (YYYY-MM-DD): ");
        String dueDate = scanner.nextLine();
        System.out.print("Priority (1-5): ");
        int priority = scanner.nextInt();
        scanner.nextLine(); // skip newline
        System.out.print("Category: ");
        String category = scanner.nextLine();
        System.out.print("Status (TODO, DOING, DONE): ");
        String status = scanner.nextLine();

        Task task = new Task(name, description, dueDate, priority, category, status);
        repo.addTask(task);
        System.out.println("Task added successfully!");
    }

    private void listTasks() {
        List<Task> tasks = repo.getAllTasks();
        if (tasks.isEmpty()) {
            System.out.println("No tasks found.");
        } else {
            for (int i = 0; i < tasks.size(); i++) {
                System.out.println(i + " - " + tasks.get(i));
            }
        }
    }

    private void deleteTask() {
        listTasks();
        System.out.print("Enter the index of the task to delete: ");
        int index = scanner.nextInt();
        scanner.nextLine(); // skip newline
        repo.deleteTask(index);
        System.out.println("Task deleted (if index was valid).");
    }

    private void listByCategory() {
        System.out.print("Enter category: ");
        String category = scanner.nextLine();
        List<Task> tasks = repo.getTasksByCategory(category);
        printTasks(tasks);
    }

    private void listByPriority() {
        System.out.print("Enter priority (1-5): ");
        int priority = scanner.nextInt();
        scanner.nextLine(); // skip newline
        List<Task> tasks = repo.getTasksByPriority(priority);
        printTasks(tasks);
    }

    private void listByStatus() {
        System.out.print("Enter status (TODO, DOING, DONE): ");
        String status = scanner.nextLine();
        List<Task> tasks = repo.getTasksByStatus(status);
        printTasks(tasks);
    }

    private void printTasks(List<Task> tasks) {
        if (tasks.isEmpty()) {
            System.out.println("No tasks found.");
        } else {
            for (Task t : tasks) {
                System.out.println(t);
            }
        }
    }
}
