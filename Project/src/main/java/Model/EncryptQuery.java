package Model;

import java.util.List;

public class EncryptQuery {
    private String condition;
    private List<String> listConditions;

    public EncryptQuery(String condition, List<String> listConditions) {
        this.condition = condition;
        this.listConditions = listConditions;
    }

    public String getCondition() {
        return condition;
    }

    public List<String> getListConditions() {
        return listConditions;
    }
}
