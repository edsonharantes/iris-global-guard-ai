package iris.global.models.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "guard.GlobalSnapshot")
@Builder
@Getter
@Setter
public class GlobalSnapshotDate {
    @Id
    @Column(name = "ID")
    private Long id;

    @Column(name = "AllocatedMB")
    private BigDecimal allocatedMB;

    @Column(name = "GlobalName")
    private String globalName;

    @Column(name = "GrowthMB")
    private BigDecimal growthMB;

    @Column(name = "GrowthPct")
    private BigDecimal growthPct;

    @Column(name = "Location")
    private String location;

    @Column(name = "PrevSnapshotId")
    private Long prevSnapshotId;

    @Column(name = "SnapshotDate")
    private LocalDate snapshotDate;

    @Column(name = "Tables")
    private String tables;

    @Column(name = "UsedMB")
    private BigDecimal usedMB;
}
