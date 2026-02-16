package iris.global.models.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public record GlobalSnapshotDTO(
    Long id,
    BigDecimal allocatedMB,
    String globalName,
    BigDecimal growthMB,
    BigDecimal growthPct,
    String location,
    Long prevSnapshotId,
    LocalDate snapshotDate,
    String tables,
    BigDecimal usedMB
) {}
