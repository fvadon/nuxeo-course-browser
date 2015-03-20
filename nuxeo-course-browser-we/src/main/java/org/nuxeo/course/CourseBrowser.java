/**
 *
 */

package org.nuxeo.course;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.nuxeo.ecm.webengine.model.WebObject;
import org.nuxeo.ecm.webengine.model.impl.ModuleRoot;


/**
 * The root entry for the WebEngine module.
 * @author fvadon
 */
@Path("/course")
@Produces("text/html;charset=UTF-8")
@WebObject(type="CourseBrowser")
public class CourseBrowser extends ModuleRoot {

    @GET
    public Object doGet() {
        return getView("index");
    }

    @GET
    @Path("region/{regionName}")
    @Produces("text/html")
    public Object goToRegion(@PathParam("regionName") String regionName) {
        ctx.setProperty("regionName", regionName);
        return getView("region");
    }

}
