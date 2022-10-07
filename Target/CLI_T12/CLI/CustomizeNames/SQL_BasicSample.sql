CREATE TABLE PUBLIC.TABLE0
(
    C1 INTEGER NOT NULL
);

CREATE TABLE PUBLIC.TABLE1
(
    C1 INTEGER NOT NULL
)
/*** MSC-WARNING - MSCEWI2065 - NON UNIQUE PRIMARY INDEX IS NOT SUPPORTED IN SNOWFLAKE ***/
/*PRIMARY INDEX(C1)*/;

CREATE TABLE PUBLIC.TABLE2 (
    C1 INTEGER NOT NULL,
    UNIQUE (C1)
);

--Test errors
CREATE OR REPLACE PROCEDURE PROC.PUBLIC.ERROR1 ()
RETURNS STRING
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS
$$
 	// REGION SnowConvert Helpers Code
	var HANDLE_NOTFOUND;
	var _RS, ROW_COUNT, _ROWS, MESSAGE_TEXT, SQLCODE = 0, SQLSTATE = '00000', ERROR_HANDLERS, ACTIVITY_COUNT = 0, INTO, _OUTQUERIES = [], DYNAMIC_RESULTS = -1;
	var formatDate = (arg) => (new Date(arg - (arg.getTimezoneOffset() * 60000))).toISOString().slice(0,-1);
	var fixBind = function (arg) {
	   arg = arg == undefined ? null : arg instanceof Date ? formatDate(arg) : arg;
	   return arg;
	};
	var EXEC = function (stmt,binds,noCatch,catchFunction,opts) {
	   try {
	      binds = binds ? binds.map(fixBind) : binds;
	      _RS = snowflake.createStatement({
	            sqlText : stmt,
	            binds : binds
	         });
	      _ROWS = _RS.execute();
	      ROW_COUNT = _RS.getRowCount();
	      ACTIVITY_COUNT = _RS.getNumRowsAffected();
	      HANDLE_NOTFOUND && HANDLE_NOTFOUND(_RS);
	      if (INTO) return {
	         INTO : function () {
	            return INTO();
	         }
	      };
	      if (_OUTQUERIES.length < DYNAMIC_RESULTS) _OUTQUERIES.push(_ROWS.getQueryId());
	      if (opts && opts.temp) return _ROWS.getQueryId();
	   } catch(error) {
	      MESSAGE_TEXT = error.message;
	      SQLCODE = error.code;
	      SQLSTATE = error.state;
	      var msg = `ERROR CODE: ${SQLCODE} SQLSTATE: ${SQLSTATE} MESSAGE: ${MESSAGE_TEXT}`;
	      if (catchFunction) catchFunction(error);
	      if (!noCatch && ERROR_HANDLERS) ERROR_HANDLERS(error); else throw new Error(msg);
	   }
	};
	// END REGION
	
	var sql_stmt = `DROP TABLE PUBLIC.TABLE1;`;
	EXEC(sql_stmt,[]);
	var sql_stmt = `DROP TABLE PUBLIC.TABLE2;`;
	EXEC(sql_stmt,[]);
	var sql_stmt = `DROP TABLE PUBLIC.TABLE3;`;
	EXEC(sql_stmt,[]);
 
$$;

--Test errors
CREATE OR REPLACE PROCEDURE PROC.PUBLIC.ERROR2 ()
RETURNS STRING
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS
$$
 	// REGION SnowConvert Helpers Code
	var HANDLE_NOTFOUND;
	var _RS, ROW_COUNT, _ROWS, MESSAGE_TEXT, SQLCODE = 0, SQLSTATE = '00000', ERROR_HANDLERS, ACTIVITY_COUNT = 0, INTO, _OUTQUERIES = [], DYNAMIC_RESULTS = -1;
	var formatDate = (arg) => (new Date(arg - (arg.getTimezoneOffset() * 60000))).toISOString().slice(0,-1);
	var fixBind = function (arg) {
	   arg = arg == undefined ? null : arg instanceof Date ? formatDate(arg) : arg;
	   return arg;
	};
	var EXEC = function (stmt,binds,noCatch,catchFunction,opts) {
	   try {
	      binds = binds ? binds.map(fixBind) : binds;
	      _RS = snowflake.createStatement({
	            sqlText : stmt,
	            binds : binds
	         });
	      _ROWS = _RS.execute();
	      ROW_COUNT = _RS.getRowCount();
	      ACTIVITY_COUNT = _RS.getNumRowsAffected();
	      HANDLE_NOTFOUND && HANDLE_NOTFOUND(_RS);
	      if (INTO) return {
	         INTO : function () {
	            return INTO();
	         }
	      };
	      if (_OUTQUERIES.length < DYNAMIC_RESULTS) _OUTQUERIES.push(_ROWS.getQueryId());
	      if (opts && opts.temp) return _ROWS.getQueryId();
	   } catch(error) {
	      MESSAGE_TEXT = error.message;
	      SQLCODE = error.code;
	      SQLSTATE = error.state;
	      var msg = `ERROR CODE: ${SQLCODE} SQLSTATE: ${SQLSTATE} MESSAGE: ${MESSAGE_TEXT}`;
	      if (catchFunction) catchFunction(error);
	      if (!noCatch && ERROR_HANDLERS) ERROR_HANDLERS(error); else throw new Error(msg);
	   }
	};
	// END REGION
	
	var sql_stmt = `DROP TABLE PUBLIC.TABLE1;`;
	EXEC(sql_stmt,[]);
 
$$;

--Test Function expression
CREATE OR REPLACE PROCEDURE SNOWCONVERT.PUBLIC.DYNAMIC_RESULT_SETS ()
RETURNS STRING
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS
$$
 	// REGION SnowConvert Helpers Code
	var HANDLE_NOTFOUND;
	var fetch = (count,rows,stmt) => (count && rows.next() && Array.apply(null,Array(stmt.getColumnCount())).map((_,i) => rows.getColumnValue(i + 1))) || [];
	var _RS, ROW_COUNT, _ROWS, MESSAGE_TEXT, SQLCODE = 0, SQLSTATE = '00000', ERROR_HANDLERS, ACTIVITY_COUNT = 0, INTO, _OUTQUERIES = [], DYNAMIC_RESULTS = -1;
	var formatDate = (arg) => (new Date(arg - (arg.getTimezoneOffset() * 60000))).toISOString().slice(0,-1);
	var fixBind = function (arg) {
	   arg = arg == undefined ? null : arg instanceof Date ? formatDate(arg) : arg;
	   return arg;
	};
	var EXEC = function (stmt,binds,noCatch,catchFunction,opts) {
	   try {
	      binds = binds ? binds.map(fixBind) : binds;
	      _RS = snowflake.createStatement({
	            sqlText : stmt,
	            binds : binds
	         });
	      _ROWS = _RS.execute();
	      ROW_COUNT = _RS.getRowCount();
	      ACTIVITY_COUNT = _RS.getNumRowsAffected();
	      HANDLE_NOTFOUND && HANDLE_NOTFOUND(_RS);
	      if (INTO) return {
	         INTO : function () {
	            return INTO();
	         }
	      };
	      if (_OUTQUERIES.length < DYNAMIC_RESULTS) _OUTQUERIES.push(_ROWS.getQueryId());
	      if (opts && opts.temp) return _ROWS.getQueryId();
	   } catch(error) {
	      MESSAGE_TEXT = error.message;
	      SQLCODE = error.code;
	      SQLSTATE = error.state;
	      var msg = `ERROR CODE: ${SQLCODE} SQLSTATE: ${SQLSTATE} MESSAGE: ${MESSAGE_TEXT}`;
	      if (catchFunction) catchFunction(error);
	      if (!noCatch && ERROR_HANDLERS) ERROR_HANDLERS(error); else throw new Error(msg);
	   }
	};
	var INTO = () => fetch(ROW_COUNT,_ROWS,_RS);
	// END REGION
	
	if ((EXEC(`SELECT
	   COALESCE(is_Override, 'N')`,[]).INTO())[0] != `Y`) {
	   v_count_lm_run = 0;
	} else {
	   v_count_loaded_pos = 3;
	}
 
$$;

CREATE MATERIALIZED VIEW DataBaseName1.PUBLIC.JoinName AS
SELECT
    col1,
    col2,
    col3 FROM
    PUBLIC.atable;

    CREATE OR REPLACE PROCEDURE PUBLIC.new_emp1oyee (NUMBER FLOAT, NAME VARCHAR(12), DEPT FLOAT, POSITION VARCHAR(12), SEX CHARACTER, DOB DATE, EDLEV FLOAT)
    RETURNS STRING
    LANGUAGE JAVASCRIPT
    EXECUTE AS CALLER
    AS
    $$
 	// REGION SnowConvert Helpers Code
	var HANDLE_NOTFOUND;
	var _RS, ROW_COUNT, _ROWS, MESSAGE_TEXT, SQLCODE = 0, SQLSTATE = '00000', ERROR_HANDLERS, ACTIVITY_COUNT = 0, INTO, _OUTQUERIES = [], DYNAMIC_RESULTS = -1;
	var formatDate = (arg) => (new Date(arg - (arg.getTimezoneOffset() * 60000))).toISOString().slice(0,-1);
	var fixBind = function (arg) {
	   arg = arg == undefined ? null : arg instanceof Date ? formatDate(arg) : arg;
	   return arg;
	};
	var EXEC = function (stmt,binds,noCatch,catchFunction,opts) {
	   try {
	      binds = binds ? binds.map(fixBind) : binds;
	      _RS = snowflake.createStatement({
	            sqlText : stmt,
	            binds : binds
	         });
	      _ROWS = _RS.execute();
	      ROW_COUNT = _RS.getRowCount();
	      ACTIVITY_COUNT = _RS.getNumRowsAffected();
	      HANDLE_NOTFOUND && HANDLE_NOTFOUND(_RS);
	      if (INTO) return {
	         INTO : function () {
	            return INTO();
	         }
	      };
	      if (_OUTQUERIES.length < DYNAMIC_RESULTS) _OUTQUERIES.push(_ROWS.getQueryId());
	      if (opts && opts.temp) return _ROWS.getQueryId();
	   } catch(error) {
	      MESSAGE_TEXT = error.message;
	      SQLCODE = error.code;
	      SQLSTATE = error.state;
	      var msg = `ERROR CODE: ${SQLCODE} SQLSTATE: ${SQLSTATE} MESSAGE: ${MESSAGE_TEXT}`;
	      if (catchFunction) catchFunction(error);
	      if (!noCatch && ERROR_HANDLERS) ERROR_HANDLERS(error); else throw new Error(msg);
	   }
	};
	var procname = `PUBLIC.new_emp1oyee`;
	var temptable_prefix, tablelist = [];
	var INSERT_TEMP = function (query,parameters) {
	   if (!temptable_prefix) {
	      var sql_stmt = `select current_session() || '_' || to_varchar(current_timestamp, 'yyyymmddhh24missss')`;
	      var rs = snowflake.createStatement({
	         sqlText : sql_stmt,
	         binds : []
	      }).execute();
	      temptable_prefix = rs.next() && (procname + '_TEMP_' + rs.getColumnValue(1) + '_');
	   }
	   var tablename = temptable_prefix + tablelist.length;
	   tablelist.push(tablename);
	   var sql_stmt = `CREATE OR REPLACE TEMPORARY TABLE ${tablename} AS ${query}`;
	   snowflake.execute({
	      sqlText : sql_stmt,
	      binds : parameters
	   });
	   return tablename;
	};
	// END REGION
	
	// ** MSC-WARNING - MSCEWI1022 - ONE OR MORE IDENTIFIERS IN THIS STATEMENT WERE CONSIDERED PARAMETERS BY DEFAULT. REFERENCED TABLE NOT FOUND. **
	EXEC(`INSERT INTO PUBLIC.employee (empno, name, deptno, jobtitle, sex, dob, edlev)
	VALUES (:1, :2, :3, :4, :5, :6, :7)`,[NUMBER,NAME,DEPT,POSITION,SEX,DOB,EDLEV]);
	INSERT_TEMP(`SELECT
	   *
	FROM
	   PUBLIC.employee
	WHERE
	   empno = :1`,[NUMBER]);
	return tablelist;
 
$$;

    CREATE OR REPLACE FUNCTION PUBLIC.calc1 (FUNC CHARACTER(1), A INTEGER, B INTEGER)
   RETURNS INTEGER
    LANGUAGE SQL
    AS
    $$
 CASE
	   WHEN func = 'A'
	      THEN A + B
	   WHEN func = 'S'
	      THEN A - B
	   WHEN func = 'M'
	      THEN A * B
	      ELSE TRUNC( A / B)
	END 
$$;

    CREATE OR REPLACE FUNCTION test.PUBLIC.myudf (A VARCHAR(34))
   RETURNS VARCHAR(34)
    LANGUAGE SQL
    AS
    $$
 /*** MSC-ERROR - MSCEWI1031 - PRIOR FUNCTION NOT SUPPORTED ***/
	PUBLIC.PRIOR_UDF('PRIOR(PUBLIC.PERIOD_END_UDF(a) /*** MSC-WARNING - MSCEWI1020 - CUSTOM UDF \'PERIOD_END_UDF\' INSERTED. ***/ /*** MSC-WARNING - MSCEWI2053 - SNOWFLAKE DOES NOT SUPPORT THE PERIOD DATATYPE, ALL PERIODS ARE HANDLED AS VARCHAR INSTEAD ***/)') 
$$;

    /*** MSC-WARNING - MSCEWI1050 - MISSING DEPENDENT OBJECT "SomeTable" ***/
    CREATE OR REPLACE VIEW ZAI_P_Source.PUBLIC."JAVA$CLASS$MD5$TABLE"
    AS
    SELECT
    MAX(CASE
            WHEN (CNT_CF=1)
                THEN Object3
            ELSE NULL
    END) OVER(PARTITION BY CIF_C
                    ORDER BY IND_NP) AS Object1,
    /*** MSC-WARNING - MSCEWI2001 - 'Object2' HAS RECURSIVE REFERENCES. FORWARD ALIAS CONVERSION COULD NOT BE COMPLETED ***/
    MAX(CASE
            WHEN (CNT_CF=1)
                THEN Object3
            ELSE NULL
    END) OVER(PARTITION BY CIF_C
                    ORDER BY IND_P) AS Object2,
    /*** MSC-WARNING - MSCEWI2001 - 'Object3' HAS RECURSIVE REFERENCES. FORWARD ALIAS CONVERSION COULD NOT BE COMPLETED ***/
    CASE
            WHEN RSDT_ADRS_I = 'N'
                THEN Object1
            WHEN CUST_TYP_C = 'P'
                THEN Object2
        ELSE NULL
    END AS Object3
    FROM
    PUBLIC.SomeTable;

    CREATE OR REPLACE VIEW PUBLIC.PUBLIC.NEWVIEW
    AS
    SELECT
    COLUMN1 as COLUMN2,
    /*** MSC-WARNING - MSCEWI2001 - 'COLUMN1' HAS RECURSIVE REFERENCES. FORWARD ALIAS CONVERSION COULD NOT BE COMPLETED ***/
    COLUMN2 as COLUMN1,
    COLUMN3
    From
    PUBLIC.TABLE1
    where COLUMN1= CURRENT_DATE;