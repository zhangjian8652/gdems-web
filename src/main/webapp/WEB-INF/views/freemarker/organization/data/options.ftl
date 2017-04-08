[#if organizations??]
    [#list organizations as organization ]
    <option value="${organization.id!}">${organization.name!}</option>
    [/#list]
[/#if]
