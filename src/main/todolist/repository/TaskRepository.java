package todolist.repository;

import todolist.model.Task;
import java.util.ArrayList;
import java.util.List;

public class TaskRepository {

    private List<Task> tasks;

    public TaskRepository() {
        tasks = new ArrayList<>();
    }

    public void addTask(Task newTask) {
        if (tasks.isEmpty()) {
            tasks.add(newTask);
            return;
        }

        int i = 0;
        while (i < tasks.size() && tasks.get(i).getPriority() >= newTask.getPriority()) {
            i++;
        }
        tasks.add(i, newTask);
    }

    // Read
    public List<Task> getTasksByCategory(String category) {
        List<Task> result = new ArrayList<>();
        for (Task t : tasks) {
            if (t.getCategory().equalsIgnoreCase(category)) {
                result.add(t);
            }
        }
        return result;
    }

    public List<Task> getTasksByPriority(int priority) {
        List<Task> result = new ArrayList<>();
        for (Task t : tasks) {
            if (t.getPriority() == priority) {
                result.add(t);
            }
        }
        return result;
    }

    public List<Task> getTasksByStatus(String status) {
        List<Task> result = new ArrayList<>();
        for (Task t : tasks) {
            if (t.getStatus().equalsIgnoreCase(status)) {
                result.add(t);
            }
        }
        return result;
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