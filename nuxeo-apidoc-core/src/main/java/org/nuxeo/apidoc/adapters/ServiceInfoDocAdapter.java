package org.nuxeo.apidoc.adapters;

import java.io.Serializable;

import org.nuxeo.apidoc.api.BundleInfo;
import org.nuxeo.apidoc.api.ExtensionInfo;
import org.nuxeo.apidoc.api.ServiceInfo;
import org.nuxeo.common.utils.Path;
import org.nuxeo.ecm.core.api.Blob;
import org.nuxeo.ecm.core.api.CoreSession;
import org.nuxeo.ecm.core.api.DocumentModel;
import org.nuxeo.ecm.core.api.PathRef;
import org.nuxeo.ecm.core.api.impl.blob.StringBlob;

public class ServiceInfoDocAdapter extends BaseNuxeoArtifactDocAdapter
        implements ServiceInfo {


    public static ServiceInfoDocAdapter create(ServiceInfo si,
            CoreSession session, String containerPath) throws Exception {

        DocumentModel doc = session.createDocumentModel(TYPE_NAME);

        String name = computeDocumentName("service-"+si.getId());
        String targetPath = new Path(containerPath).append(name).toString();
        boolean exist = false;
        if (session.exists(new PathRef(targetPath))) {
            exist = true;
            doc = session.getDocument(new PathRef(targetPath));
        }
        doc.setPathInfo(containerPath, name);
        doc.setPropertyValue("dc:title", si.getId());

        doc.setPropertyValue("nxservice:className", si.getId());

        if (exist) {
            doc = session.saveDocument(doc);
        } else {
            doc = session.createDocument(doc);
        }

        return new ServiceInfoDocAdapter(doc);
    }


    public ServiceInfoDocAdapter(DocumentModel doc) {
        super(doc);
    }

    @Override
    public String getId() {
        return safeGet("nxservice:className", "unknown_service");
    }

    public String getArtifactType() {
        return ServiceInfo.TYPE_NAME;
    }

    public String getVersion() {
          BundleInfo parentBundle = getParentNuxeoArtifact(BundleInfo.class);

          if (parentBundle!=null) {
              return parentBundle.getVersion();
          }

          log.error("Unable to determine version for Service " + getId());
          return "?";
    }

}