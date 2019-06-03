package vgu.group1.examregister.views.assistant.user;

import vgu.group1.examregister.database.Account;
import vgu.group1.examregister.views.BaseView;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.sql.SQLException;

@Path("/assistant/user/view")
public class View extends BaseView {
    @GET
    public Response doGet(@QueryParam("role") String role) throws IOException, SQLException {
        if (role == null)
            return Response.ok(getHTMLFile("assistant/view_users.html"), MediaType.TEXT_HTML).build();

        String answer;
        switch (role) {
            case "assistant":
                answer = Account.listAllAssistants().toString();
                break;
            case "student":
                answer = Account.listAllStudents().toString();
                break;
            case "lecturer":
                answer = Account.listAllLecturers().toString();
                break;
            default:
                return Response.status(400).build();
        }
        return Response.ok(answer, MediaType.APPLICATION_JSON).build();
    }
}
