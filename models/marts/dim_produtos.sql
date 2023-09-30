with 
    stg_categorias as (
        select * from {{ ref('stg_erp_categorias') }}
    )

    ,stg_fornecedores as (
        select * from {{ ref('stg_erp_fornecedores') }}
    )

    ,stg_produtos as (
        select * from {{ ref('stg_erp_produtos') }}
    )

    ,join_tabelas as (
        select 
            prd.id_produto
            ,prd.id_fornecedor
            ,prd.id_categoria
            ,prd.nome_produto
            ,prd.quantidade_por_unidade
            ,prd.preco_por_unidade
            ,prd.unidades_em_estoque
            ,prd.unidades_por_ordem
            ,prd.nivel_abestecimento
            ,prd.is_discontinuado
            ,cat.nome_categoria
            ,cat.descricao_categoria        
            ,frn.nome_fornecedor
            ,frn.contato_fornecedor
            ,frn.contato_cargo
            ,frn.endereco_fornecedor
            ,frn.cidade_fornecedor
            ,frn.regiao_fornecedor
            ,frn.pais_fornecedor
            ,frn.cep_fornecedor
            from stg_produtos prd
            left join stg_categorias cat on cat.id_categoria = prd.id_categoria
            left join stg_fornecedores frn on frn.id_fornecedor = prd.id_fornecedor 
    )

    ,criar_chave as (
        select row_number() over(order by id_produto) as pk_produto
               ,*
        from join_tabelas
    )

select * from criar_chave

