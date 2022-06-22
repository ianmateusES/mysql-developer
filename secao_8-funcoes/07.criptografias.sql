/*
 * Funções matemáticas - MD5
 */
    -- Query 1
    SELECT MD5('abcdef1234') AS retorno;


/*
 * Funções matemáticas - SHA
 */
    -- Query 1 - Mesma criptografia sha e sha1
    SELECT
        SHA('123456') AS sha,
        SHA1('123456') AS sha1;

    -- Query 2 - SHA2 (SHA-224, SHA-256, SHA-384, and SHA-512)
    SELECT
        SHA2('abc', 224) AS hash224,
        SHA2('abc', 256) AS hash256,
        SHA2('abc', 384) AS hash384,
        SHA2('abc', 512) AS hash516;

    -- Query 3 - Verificando tamanho em bits (SHA-224, SHA-256, SHA-384, and SHA-512)
    SELECT
        BIT_LENGTH(SHA2('abc', 224)) AS hash224,
        BIT_LENGTH(SHA2('abc', 256)) AS hash256,
        BIT_LENGTH(SHA2('abc', 384)) AS hash384,
        BIT_LENGTH(SHA2('abc', 512)) AS hash516

    -- Query 4 - Verificando o tamnho (SHA-224, SHA-256, SHA-384, and SHA-512)
    SELECT
        LENGTH(SHA2('abc', 224)) AS hash224,
        LENGTH(SHA2('abc', 256)) AS hash256,
        LENGTH(SHA2('abc', 384)) AS hash384,
        LENGTH(SHA2('abc', 512)) AS hash516;
