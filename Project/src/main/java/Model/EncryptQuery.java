package Model;

import java.util.List;

public class EncryptQuery {
    private String query;
    private List<String> listConditions;

    public EncryptQuery(String query, List<String> listConditions) {
        this.query = query;
        this.listConditions = listConditions;
    }

    public String getQuery() {
        return query;
    }

    public List<String> getListConditions() {
        return listConditions;
    }
}
