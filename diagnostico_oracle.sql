-- ==================================================
-- ALX Pro - Oracle Database Health Check
-- ==================================================
-- Script para verificar a saúde de tablespaces
-- e sessões ativas no banco de dados Oracle.

SET PAGESIZE 100
SET LINESIZE 200

PROMPT ===============================================
PROMPT ALX Pro - Oracle Database Health Check
PROMPT ===============================================

PROMPT
PROMPT --- VERIFICANDO USO DE TABLESPACES ---
SELECT
    tablespace_name,
    used_mbytes,
    free_mbytes,
    ROUND((used_mbytes / max_mbytes) * 100, 2) AS percent_used
FROM
    df_storage_report;

PROMPT
PROMPT --- VERIFICANDO SESSOES ATIVAS ---
SELECT
    username,
    status,
    osuser,
    machine
FROM
    v$session
WHERE
    status = 'ACTIVE';

PROMPT
PROMPT --- DIAGNOSTICO ALX PRO FINALIZADO ---
