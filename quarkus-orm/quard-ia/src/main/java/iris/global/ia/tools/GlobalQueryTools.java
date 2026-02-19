package iris.global.ia.tools;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.langchain4j.agent.tool.Tool;
import jakarta.annotation.Nonnull;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;

@ApplicationScoped
public class GlobalQueryTools {

    @Inject
    EntityManager em;

    @Tool("""
                You are calling a system inspection tool for InterSystems IRIS globals.

                PURPOSE:
                List globals that exist inside a specific IRIS namespace, optionally filtered by a global name pattern.

                This tool queries the IRIS system catalog and returns metadata about globals, such as:
                - Global name
                - Physical storage location (database)
                - Whether the global has data
                - Whether it has subscripts
                - Journaling status
                - Collation type

                WHEN TO USE:
                - When the user asks to list globals in a namespace
                - When the user asks to inspect, audit, explore, or analyze globals
                - When the user wants to know which globals exist before further analysis
                - When preparing diagnostics, monitoring, or capacity analysis involving globals

                WHEN NOT TO USE:
                - Do NOT use to read global data or records
                - Do NOT use if the namespace is unknown
                - Do NOT use for SQL tables, classes, or routines

                PARAMETERS:
                - namespace (String) [required]
                Description: The IRIS namespace to inspect (e.g. USER, APP, IRISAPP).
                How to use: Must match an existing namespace exactly.
                Example: "USER"

                - globalNamePattern (String) [required]
                Description: A pattern to filter global names.
                How to use:
                    - "*" to analyze all globals in the location
                    - Prefix-based filtering using "*"
                Example: "*", "Ens*", "MyApp*"

                RULES:
                - Only call this tool if the namespace is explicitly known.
                - Never invent or assume a namespace.
                - Never invent a global name pattern.
                - If the user did not specify a pattern, use "*" explicitly.
                - If required information is missing, ask the user before calling the tool.

                OUTPUT:
                Returns a list of globals with metadata fields:
                name, location, hasData, hasSubscripts, journal, collation.
            """)
    @Nonnull
    @SuppressWarnings("null")
    public List<Map<String, Object>> listGlobalsInNamespace(String namespace, String globalNamePattern) {

        @SuppressWarnings("unchecked")
        List<Object[]> rows = em.createNativeQuery("""
                    SELECT
                        Name,
                        Location,
                        HasData,
                        HasSubscripts,
                        Journal,
                        Collation
                    FROM %SYS.GlobalQuery_NameSpaceList(:ns, :pattern, 0)
                """)
                .setParameter("ns", namespace.trim())
                .setParameter("pattern", globalNamePattern.trim())
                .getResultList();

        return rows.stream()
                .map(row -> {
                    Map<String, Object> m = new HashMap<>();
                    m.put("name", row[0]);
                    m.put("location", row[1]);
                    m.put("hasData", row[2]);
                    m.put("hasSubscripts", row[3]);
                    m.put("journal", row[4]);
                    m.put("collation", row[5]);
                    return m;
                })
                .toList();
    }

    @Tool("""
            You are calling a storage analysis tool for InterSystems IRIS globals.

            PURPOSE:
            Analyze disk usage of globals stored in a specific IRIS database location.
            This tool returns allocated space and actual used space (in MB) for each global.

            This tool is intended for capacity planning, storage diagnostics, and monitoring.

            WHEN TO USE:
            - When the user asks about disk usage, size, or storage consumption of globals
            - When analyzing which globals consume more space
            - When investigating database growth or storage issues
            - After identifying globals and their storage locations

            WHEN NOT TO USE:
            - Do NOT use without a known database location
            - Do NOT use to list globals across all locations
            - Do NOT use for namespaces, tables, or routines
            - Do NOT guess the database location

            PARAMETERS:
            - location (String) [required]
            Description: Physical database location name where the globals are stored.
            How to use: Must match the IRIS database name exactly as returned by system queries.
            Example: "IRISDATA", "USERDATA"

            - globalNamePattern (String) [required]
            Description: Pattern to filter which globals are included in the size analysis.
            How to use:
                - "*" to analyze all globals in the location
                - Prefix-based filtering using "*"
            Example: "*", "Ens*", "MyApp.*"

            RULES:
            - Only call this tool if the database location is explicitly known.
            - Never invent or assume the location.
            - Never invent global name patterns.
            - If the user did not specify a pattern, use "%" explicitly.
            - If the required parameters are missing, ask the user before calling the tool.

            OUTPUT:
            Returns a list of globals with storage metrics:
            globalName, allocatedMB, usedMB.
            """)
    @Nonnull
    @SuppressWarnings("null")
    public List<Map<String, Object>> globalDiskUsageByLocation(
            String location,
            String globalNamePattern) {

        @SuppressWarnings("unchecked")
        List<Object[]> rows = em.createNativeQuery("""
                    SELECT
                        Name,
                        "Allocated MB",
                        "Used MB"
                    FROM %SYS.GlobalQuery_Size(:loc, '', :pattern, '2')
                """)
                .setParameter("loc", location)
                .setParameter("pattern", globalNamePattern)
                .getResultList();

        return rows.stream()
                .map(row -> {
                    Map<String, Object> m = new HashMap<>();
                    m.put("globalName", row[0]);
                    m.put("allocatedMB", row[1]);
                    m.put("usedMB", row[2]);
                    return m;
                })
                .toList();
    }

}
