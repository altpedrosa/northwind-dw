with 

    fonte_fornecedores as (
        select 
            cast(supplier_id as int) as id_fornecedor
            ,cast(company_name as string) as nome_fornecedor
            ,cast(contact_name as string) as contato_fornecedor
            ,cast(contact_title as string) as contato_cargo
            ,cast(address as string) as endereco_fornecedor
            ,cast(city as string) as cidade_fornecedor
            ,cast(region as string) as regiao_fornecedor
            ,cast(country as string) as pais_fornecedor
            ,cast(postal_code as string) as cep_fornecedor
            --phone
            --fax
            --homepage            
        from {{ source('erp_northwind', 'suppliers') }}
    )

select * from fonte_fornecedores