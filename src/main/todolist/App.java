package todolist;

import todolist.repository.TaskRepository;
import todolist.ui.Menu;

public class App {

    public static void main(String[] args) {
        TaskRepository repo = new TaskRepository();
        Menu menu = new Menu(repo);
        menu.show();
    }
}
