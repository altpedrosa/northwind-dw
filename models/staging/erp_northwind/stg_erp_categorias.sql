--ctrl+shift+alt+tecla cima ou baixo para incluir escrita antes do texto

with 

    fonte_categories as (
        select 
            cast(category_id as int) as id_categoria
            ,cast(category_name as string) as nome_categoria
            ,cast(description as string) as descricao_categoria
            --,cast(picture as string) as imagem_categoria
        from {{ source('erp_northwind', 'categories') }}
    )

select * from fonte_categories