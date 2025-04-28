<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PO027.aspx.cs" Inherits="LOG_PO_poDoc2_PR_PO027_PO027" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 버튼 (Refresh, 검색, 출력) 오른쪽 정렬 -->
<div style="text-align: right; margin-top: 20px;">
    <dx:ASPxButton ID="btnRefresh" runat="server" Text="Refresh" Width="100px"></dx:ASPxButton>
    <dx:ASPxButton ID="btnSearch" runat="server" Text="검색" Width="100px"></dx:ASPxButton>
    <dx:ASPxButton ID="btnExport" runat="server" Text="출력" Width="100px"></dx:ASPxButton>
</div>
        <!-- 버튼은 여기까지 -->

        <!-- 4개의 Section 시작 -->
        <div>
        <table width="100%" class="smart_table_default">
    <colgroup>
        <!-- 각 열의 비율을 동일하게 설정 (중요!)-->
        <col width="25%" />
        <col width="25%" />
        <col width="25%" />
        <col width="25%" />
    </colgroup>

    <!-- 첫 번째 행: 요청기간 (좌상) 및 요청부서 (우상) -->
    <tr>
        <!-- 요청기간 (좌상) -->
        <th class="smart_table_th_center" style="background-color: #F0F8FF; padding: 5px;">
            <dx:ASPxLabel ID="lblRequestPeriod" runat="server" Text="요청기간"></dx:ASPxLabel>
        </th>
        <td class="smart_table_td_default">
            <div style="display: flex; align-items: center;">
                <dx:ASPxComboBox ID="ddlRequestPeriodStart" ClientInstanceName="ddlRequestPeriodStart" runat="server" Width="48%" 
                    ValueField="DateStart" TextField="StartDate" ValueType="System.String"></dx:ASPxComboBox>
                <span style="margin: 0 5px;">~</span>
                <dx:ASPxComboBox ID="ddlRequestPeriodEnd" ClientInstanceName="ddlRequestPeriodEnd" runat="server" Width="48%" 
                    ValueField="DateEnd" TextField="EndDate" ValueType="System.String"></dx:ASPxComboBox>
            </div>
        </td>

        <!-- 요청부서 (우상) -->
        <th class="smart_table_th_center" style="background-color: #F0F8FF; padding: 5px;">
            <dx:ASPxLabel ID="lblRequestDepartment" runat="server" Text="요청부서"></dx:ASPxLabel>
        </th>
        <td class="smart_table_td_default">
            <div style="display: flex; align-items: center;">
                <dx:ASPxTextBox ID="txtRequestDepartment" runat="server" Width="48%"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtRequestDepartmentAdditional" runat="server" Width="48%"></dx:ASPxTextBox>
                <dx:ASPxButton ID="btnSearchDepartment" runat="server" Text="조회" Width="15%"></dx:ASPxButton>
            </div>
        </td>
    </tr>

    <!-- 두 번째 행: 요청자 (좌하) 및 코스트 센터 (우하) -->
    <tr>
        <!-- 요청자 (좌하) -->
        <th class="smart_table_th_center" style="background-color: #F0F8FF; padding: 5px;">
            <dx:ASPxLabel ID="lblRequester" runat="server" Text="요청자"></dx:ASPxLabel>
        </th>
        <td class="smart_table_td_default">
            <div style="display: flex; align-items: center;">
                <dx:ASPxTextBox ID="txtRequester" runat="server" Width="48%"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtRequesterAdditional" runat="server" Width="48%"></dx:ASPxTextBox>
                <dx:ASPxButton ID="btnSearchRequester" runat="server" Text="조회" Width="15%"></dx:ASPxButton>
            </div>
        </td>

        <!-- 코스트 센터 (우하) -->
        <th class="smart_table_th_center" style="background-color: #F0F8FF; padding: 5px;">
            <dx:ASPxLabel ID="lblCostCenter" runat="server" Text="코스트 센터"></dx:ASPxLabel>
        </th>
        <td class="smart_table_td_default">
            <div style="display: flex; align-items: center;">
                <dx:ASPxTextBox ID="txtCostCenter" runat="server" Width="48%"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtCostCenterAdditional" runat="server" Width="48%"></dx:ASPxTextBox>
                <dx:ASPxButton ID="btnSearchCostCenter" runat="server" Text="조회" Width="15%"></dx:ASPxButton>
            </div>
        </td>
    </tr>
</table>
<!-- 4개의 섹션 (Table) End -->
<!-- 그리드 추가 -->
<dx:ASPxGridView ID="Grid01" ClientInstanceName="Grid01" runat="server" Width="100%" AutoGenerateColumns="false" 
    KeyFieldName="RequestNo" ColumnAutoWidth="true" ColumnResizeMode="NextColumn">
    <Styles Header-HorizontalAlign="Center" Cell-Wrap="False" />
    <Settings ShowFooter="true" ShowGroupFooter="VisibleAlways" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" />
    <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowSort="true" AllowSelectSingleRowOnly="true" ColumnResizeMode="Control" AllowDragDrop="false" />
    <SettingsPager Mode="ShowAllRecords" />

    <TotalSummary>
        <dx:ASPxSummaryItem SummaryType="Count" DisplayFormat="Count : #,#" FieldName="RequestNo" />
    </TotalSummary>

    <Columns>
        <dx:GridViewDataColumn Caption="No" ReadOnly="true" Width="50px" CellStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
        <dx:GridViewDataTextColumn FieldName="RequestDate" Caption="요청일" Width="200px" CellStyle-HorizontalAlign="Center" />
        <dx:GridViewDataTextColumn FieldName="RequestNo" Caption="요청번호" Width="400px" CellStyle-HorizontalAlign="Center" />
        <dx:GridViewDataTextColumn FieldName="RequestDepartment" Caption="요청부서" Width="150px" CellStyle-HorizontalAlign="Center" />
        <dx:GridViewDataTextColumn FieldName="Requester" Caption="요청자" Width="110px" CellStyle-HorizontalAlign="Center" />
        <dx:GridViewDataTextColumn FieldName="CostCenter" Caption="코스트센터" Width="150px" CellStyle-HorizontalAlign="Center" />
        <dx:GridViewDataTextColumn FieldName="RequestType" Caption="요청유형" Width="290px" CellStyle-HorizontalAlign="Center" />
    </Columns>
</dx:ASPxGridView>
        </div>
    </form>
</body>
</html>
