package com.citylife.dao;

import com.citylife.entity.LifeInfo;
import com.citylife.util.DBUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class LifeInfoDao {

    public List<LifeInfo> findApprovedList() {
        List<LifeInfo> list = new ArrayList<>();
        String sql = "SELECT * FROM tb_info WHERE INFO_STATE = '1' ORDER BY INFO_DATE DESC, ID DESC";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public LifeInfo findById(Integer id) {
        String sql = "SELECT * FROM tb_info WHERE ID = ?";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<LifeInfo> findByCategoryId(Integer categoryId) {
        List<LifeInfo> list = new ArrayList<>();
        String sql = "SELECT * FROM tb_info WHERE INFO_STATE = '1' AND INFO_TYPE = ? ORDER BY INFO_DATE DESC, ID DESC";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<LifeInfo> search(String keyword) {
        if (keyword == null || keyword.trim().equals("")) {
            return findApprovedList();
        }

        List<LifeInfo> list = new ArrayList<>();
        String sql = "SELECT * FROM tb_info "
                + "WHERE INFO_STATE = '1' "
                + "AND (INFO_TITLE LIKE ? OR INFO_CONTENT LIKE ? OR INFO_LINKMAN LIKE ?) "
                + "ORDER BY INFO_DATE DESC, ID DESC";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            String value = "%" + keyword.trim() + "%";
            ps.setString(1, value);
            ps.setString(2, value);
            ps.setString(3, value);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int add(LifeInfo info) {
        String sql = "INSERT INTO tb_info("
                + "INFO_TYPE, INFO_TITLE, INFO_LINKMAN, INFO_PHONE, INFO_DATE, "
                + "INFO_STATE, INFO_CONTENT, INFO_EMAIL, INFO_PAYFOR"
                + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            if (info.getInfoType() == null) {
                ps.setNull(1, Types.INTEGER);
            } else {
                ps.setInt(1, info.getInfoType());
            }

            ps.setString(2, info.getInfoTitle());
            ps.setString(3, info.getInfoLinkman());
            ps.setString(4, info.getInfoPhone());
            ps.setDate(5, new Date(System.currentTimeMillis()));
            ps.setString(6, "0");
            ps.setString(7, info.getInfoContent());
            ps.setString(8, info.getInfoEmail());
            ps.setString(9, "0");

            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
    public LifeInfo findLatestOne() {
        String sql = "SELECT * FROM tb_info WHERE INFO_STATE = '1' ORDER BY INFO_DATE DESC, ID DESC LIMIT 1";
        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) {
                return mapResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<LifeInfo> findAuditList() {
        List<LifeInfo> list = new ArrayList<>();

        String sql = "SELECT * FROM tb_info WHERE INFO_STATE='0' ORDER BY INFO_DATE DESC, ID DESC";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {
                list.add(mapResultSet(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int pass(Integer id) {

        String sql = "UPDATE tb_info SET INFO_STATE='1' WHERE ID=?";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            return ps.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return 0;
    }

    public int delete(Integer id){

        String sql="DELETE FROM tb_info WHERE ID=?";

        try(
                Connection conn=DBUtil.getConnection();
                PreparedStatement ps=conn.prepareStatement(sql)
        ){

            ps.setInt(1,id);

            return ps.executeUpdate();

        }catch (SQLException e){

            e.printStackTrace();

        }

        return 0;

    }

    private LifeInfo mapResultSet(ResultSet rs) throws SQLException {
        LifeInfo info = new LifeInfo();
        info.setId(rs.getInt("ID"));
        info.setInfoType(rs.getInt("INFO_TYPE"));
        info.setInfoTitle(rs.getString("INFO_TITLE"));
        info.setInfoLinkman(rs.getString("INFO_LINKMAN"));
        info.setInfoPhone(rs.getString("INFO_PHONE"));
        info.setInfoDate(rs.getDate("INFO_DATE"));
        info.setInfoState(rs.getString("INFO_STATE"));
        info.setInfoContent(rs.getString("INFO_CONTENT"));
        info.setInfoEmail(rs.getString("INFO_EMAIL"));
        info.setInfoPayfor(rs.getString("INFO_PAYFOR"));
        return info;
    }


}