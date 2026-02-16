package iris.global.repository;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import iris.global.models.entities.GlobalSnapshotDate;

@ApplicationScoped
public class GlobalSnapshotDateRepository implements PanacheRepository<GlobalSnapshotDate> {

}
